; DESCRIPTION: Places a cyan 79x119 rectangle at position (17, 135).
; PLAN: r0=17(x), r1=135(y), r2=79(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 135
LDI r2, 79
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
