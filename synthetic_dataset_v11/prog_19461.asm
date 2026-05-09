; DESCRIPTION: Places a cyan 43x70 rectangle at position (160, 172).
; PLAN: r0=160(x), r1=172(y), r2=43(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 43
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
