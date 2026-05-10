; DESCRIPTION: Creates a white filled rectangle of size 27x98 starting at (103, 107).
; PLAN: r0=103(x), r1=107(y), r2=27(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 107
LDI r2, 27
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
