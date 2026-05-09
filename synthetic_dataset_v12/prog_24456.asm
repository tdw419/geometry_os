; DESCRIPTION: Composite: Renders a purple box of size 24x21 starting at (96, 39) then Places a yellow dot at position (308, 172).
; PLAN: r0=96(x), r1=39(y), r2=24(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 96
LDI r1, 39
LDI r2, 24
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
