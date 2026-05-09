; DESCRIPTION: Places a white 55x78 rectangle at position (235, 144).
; PLAN: r0=235(x), r1=144(y), r2=55(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 144
LDI r2, 55
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
