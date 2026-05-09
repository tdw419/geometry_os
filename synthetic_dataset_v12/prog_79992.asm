; DESCRIPTION: Places a cyan 16x12 rectangle at position (191, 236).
; PLAN: r0=191(x), r1=236(y), r2=16(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 236
LDI r2, 16
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
