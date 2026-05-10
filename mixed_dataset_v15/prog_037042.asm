; DESCRIPTION: Places a cyan 80x45 rectangle at position (173, 132).
; PLAN: r0=173(x), r1=132(y), r2=80(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 132
LDI r2, 80
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
