; DESCRIPTION: Places a cyan 72x20 rectangle at position (215, 133).
; PLAN: r0=215(x), r1=133(y), r2=72(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 133
LDI r2, 72
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
