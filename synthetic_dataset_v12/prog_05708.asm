; DESCRIPTION: Places a cyan 47x46 rectangle at position (459, 179).
; PLAN: r0=459(x), r1=179(y), r2=47(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 179
LDI r2, 47
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
