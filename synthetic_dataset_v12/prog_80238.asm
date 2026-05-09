; DESCRIPTION: Composite: Renders a purple box of size 106x50 starting at (338, 98) then Places a purple circle of radius 39 at center (42, 180).
; PLAN: r0=338(x), r1=98(y), r2=106(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=180(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 338
LDI r1, 98
LDI r2, 106
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 180
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
