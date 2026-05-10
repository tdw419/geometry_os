; DESCRIPTION: Composite: Places a purple dot at position (429, 59) then Places a yellow 22x84 rectangle at position (96, 123).
; PLAN: r0=429(x), r1=59(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x), r6=123(y), r7=22(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 59
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 123
LDI r7, 22
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
