; DESCRIPTION: Creates a vertical cyan gradient from black to cyan.
; PLAN: r0=0(x), r1=18(y), r2=0(width), r3=1(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 18
LDI r2, 0
LDI r3, 1
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
