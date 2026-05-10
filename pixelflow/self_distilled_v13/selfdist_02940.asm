; DESCRIPTION: Runs a simple loop 22 times, decrementing a counter each iteration.
; PLAN: r0=273(x), r1=225(y), r2=22(width), r3=1(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 225
LDI r2, 22
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
