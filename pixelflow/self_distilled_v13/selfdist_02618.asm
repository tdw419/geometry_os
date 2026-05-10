; DESCRIPTION: Runs a simple loop 21 times, decrementing a counter each iteration.
; PLAN: r0=21(x), r1=21(y), r2=21(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 21
LDI r2, 21
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
