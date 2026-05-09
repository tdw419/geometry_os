; DESCRIPTION: Composite: Places a green 84x92 rectangle at position (145, 121) then Places a green circle of radius 73 at center (328, 180).
; PLAN: r0=145(x), r1=121(y), r2=84(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=180(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 121
LDI r2, 84
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 180
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
