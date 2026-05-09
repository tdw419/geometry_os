; DESCRIPTION: Places a orange 96x114 rectangle at position (235, 55).
; PLAN: r0=235(x), r1=55(y), r2=96(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 55
LDI r2, 96
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
