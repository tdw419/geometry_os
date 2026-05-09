; DESCRIPTION: Renders a black box of size 107x27 starting at (392, 19).
; PLAN: r0=392(x), r1=19(y), r2=107(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 19
LDI r2, 107
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
