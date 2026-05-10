; DESCRIPTION: Places a cyan 103x94 rectangle at position (288, 62).
; PLAN: r0=288(x), r1=62(y), r2=103(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 62
LDI r2, 103
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
