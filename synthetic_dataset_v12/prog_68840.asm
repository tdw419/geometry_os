; DESCRIPTION: Places a red 56x61 rectangle at position (453, 160).
; PLAN: r0=453(x), r1=160(y), r2=56(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 160
LDI r2, 56
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
