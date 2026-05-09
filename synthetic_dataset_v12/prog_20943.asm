; DESCRIPTION: Places a red 66x80 rectangle at position (168, 39).
; PLAN: r0=168(x), r1=39(y), r2=66(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 39
LDI r2, 66
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
