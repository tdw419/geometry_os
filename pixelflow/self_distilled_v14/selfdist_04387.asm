; DESCRIPTION: Runs a simple loop 16 times, decrementing a counter each iteration.
; PLAN: r0=4(x), r1=16(y), r2=16(width), r3=1(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 16
LDI r2, 16
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
