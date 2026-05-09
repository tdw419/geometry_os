; DESCRIPTION: Composite: Places a yellow dot at position (102, 120) then Renders a magenta box of size 16x108 starting at (360, 125).
; PLAN: r0=102(x), r1=120(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=125(y), r7=16(width), r8=108(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 102
LDI r1, 120
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 360
LDI r6, 125
LDI r7, 16
LDI r8, 108
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
