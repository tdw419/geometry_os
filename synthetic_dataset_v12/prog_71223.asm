; DESCRIPTION: Places a yellow 20x53 rectangle at position (215, 52).
; PLAN: r0=215(x), r1=52(y), r2=20(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 52
LDI r2, 20
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
