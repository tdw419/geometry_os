; DESCRIPTION: Places a red 18x68 rectangle at position (206, 4).
; PLAN: r0=206(x), r1=4(y), r2=18(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 4
LDI r2, 18
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
