; DESCRIPTION: Creates a white filled rectangle of size 21x51 starting at (349, 146).
; PLAN: r0=349(x), r1=146(y), r2=21(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 146
LDI r2, 21
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
