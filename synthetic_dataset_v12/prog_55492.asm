; DESCRIPTION: Composite: Places a purple 48x114 rectangle at position (165, 111) then Places a blue dot at position (201, 113).
; PLAN: r0=165(x), r1=111(y), r2=48(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=113(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 111
LDI r2, 48
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 113
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
