; DESCRIPTION: Places a red 73x86 rectangle at position (72, 131).
; PLAN: r0=72(x), r1=131(y), r2=73(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 131
LDI r2, 73
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
