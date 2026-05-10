; DESCRIPTION: Places a white 113x72 rectangle at position (152, 51).
; PLAN: r0=152(x), r1=51(y), r2=113(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 51
LDI r2, 113
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
