; DESCRIPTION: Places a green 30x38 rectangle at position (256, 182).
; PLAN: r0=256(x), r1=182(y), r2=30(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 182
LDI r2, 30
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
