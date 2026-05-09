; DESCRIPTION: Places a black 95x18 rectangle at position (215, 21).
; PLAN: r0=215(x), r1=21(y), r2=95(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 21
LDI r2, 95
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
