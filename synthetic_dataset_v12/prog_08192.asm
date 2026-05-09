; DESCRIPTION: Places a green 85x116 rectangle at position (235, 86).
; PLAN: r0=235(x), r1=86(y), r2=85(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 86
LDI r2, 85
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
