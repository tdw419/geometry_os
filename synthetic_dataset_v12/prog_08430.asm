; DESCRIPTION: Places a yellow 93x33 rectangle at position (152, 117).
; PLAN: r0=152(x), r1=117(y), r2=93(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 117
LDI r2, 93
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
