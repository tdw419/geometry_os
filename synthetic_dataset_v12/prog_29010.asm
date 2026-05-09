; DESCRIPTION: Places a orange 119x116 rectangle at position (180, 96).
; PLAN: r0=180(x), r1=96(y), r2=119(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 96
LDI r2, 119
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
