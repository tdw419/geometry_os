; DESCRIPTION: Composite: Places a cyan line segment connecting (415, 69) to (235, 47) then Renders a white disk with center (282, 42) and radius 35.
; PLAN: r0=415(x1), r1=69(y1), r2=235(x2), r3=47(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=42(y), r7=35(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 69
LDI r2, 235
LDI r3, 47
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 42
LDI r7, 35
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
