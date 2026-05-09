; DESCRIPTION: Composite: Places a purple dot at position (446, 170) then Renders a magenta box of size 65x35 starting at (176, 133).
; PLAN: r0=446(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=133(y), r7=65(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 170
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 133
LDI r7, 65
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
