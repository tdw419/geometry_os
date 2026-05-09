; DESCRIPTION: Composite: Places a yellow dot at position (297, 56) then Renders a orange box of size 82x46 starting at (127, 32).
; PLAN: r0=297(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=32(y), r7=82(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 127
LDI r6, 32
LDI r7, 82
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
