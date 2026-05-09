; DESCRIPTION: Places a cyan 113x16 rectangle at position (132, 172).
; PLAN: r0=132(x), r1=172(y), r2=113(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 172
LDI r2, 113
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
