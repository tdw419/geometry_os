; DESCRIPTION: Composite: Renders a white disk with center (121, 113) and radius 79 then Places a cyan 48x67 rectangle at position (73, 94).
; PLAN: r0=121(x), r1=113(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=94(y), r7=48(width), r8=67(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 121
LDI r1, 113
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 94
LDI r7, 48
LDI r8, 67
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
