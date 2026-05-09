; DESCRIPTION: Places a red 115x95 rectangle at position (152, 137).
; PLAN: r0=152(x), r1=137(y), r2=115(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 137
LDI r2, 115
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
