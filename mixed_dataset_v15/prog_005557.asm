; DESCRIPTION: Places a white 102x92 rectangle at position (393, 161).
; PLAN: r0=393(x), r1=161(y), r2=102(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 161
LDI r2, 102
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
