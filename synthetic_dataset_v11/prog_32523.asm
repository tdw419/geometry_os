; DESCRIPTION: Places a red 79x86 rectangle at position (40, 112).
; PLAN: r0=40(x), r1=112(y), r2=79(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 112
LDI r2, 79
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
