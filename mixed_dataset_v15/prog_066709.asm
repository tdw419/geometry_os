; DESCRIPTION: Creates a white filled rectangle of size 43x64 starting at (362, 174).
; PLAN: r0=362(x), r1=174(y), r2=43(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 174
LDI r2, 43
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
