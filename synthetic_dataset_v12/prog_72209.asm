; DESCRIPTION: Places a red 94x68 rectangle at position (256, 165).
; PLAN: r0=256(x), r1=165(y), r2=94(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 165
LDI r2, 94
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
