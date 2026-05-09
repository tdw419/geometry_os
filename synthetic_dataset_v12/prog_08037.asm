; DESCRIPTION: Composite: Places a white circle of radius 14 at center (308, 148) then Draws a cyan line from (235, 206) to (5, 253).
; PLAN: r0=308(x), r1=148(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x1), r6=206(y1), r7=5(x2), r8=253(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 148
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 206
LDI r7, 5
LDI r8, 253
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
