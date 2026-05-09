; DESCRIPTION: Places a green 28x45 rectangle at position (181, 161).
; PLAN: r0=181(x), r1=161(y), r2=28(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 161
LDI r2, 28
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
