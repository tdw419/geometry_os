; DESCRIPTION: Places a cyan 16x112 rectangle at position (346, 74).
; PLAN: r0=346(x), r1=74(y), r2=16(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 74
LDI r2, 16
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
