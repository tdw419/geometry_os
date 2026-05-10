; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=3(x), r1=18(y), r2=0(width), r3=9(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 18
LDI r2, 0
LDI r3, 9
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
