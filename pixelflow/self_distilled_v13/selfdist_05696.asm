; DESCRIPTION: Places a red disk with center (152, 42) and radius 24.
; PLAN: r0=152(x), r1=42(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 42
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
