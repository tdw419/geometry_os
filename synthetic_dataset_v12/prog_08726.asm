; DESCRIPTION: Places a red 95x10 rectangle at position (208, 132).
; PLAN: r0=208(x), r1=132(y), r2=95(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 132
LDI r2, 95
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
