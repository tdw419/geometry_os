; DESCRIPTION: Runs a simple loop 26 times, decrementing a counter each iteration.
; PLAN: r0=437(x), r1=262(y), r2=26(width), r3=1(height), r4=0x00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 262
LDI r2, 26
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
