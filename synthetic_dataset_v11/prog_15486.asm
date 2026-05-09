; DESCRIPTION: Places a black 70x48 rectangle at position (152, 57).
; PLAN: r0=152(x), r1=57(y), r2=70(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 57
LDI r2, 70
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
