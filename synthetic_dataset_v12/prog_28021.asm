; DESCRIPTION: Places a cyan 46x119 rectangle at position (173, 131).
; PLAN: r0=173(x), r1=131(y), r2=46(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 131
LDI r2, 46
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
