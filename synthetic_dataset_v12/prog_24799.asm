; DESCRIPTION: Places a cyan 99x66 rectangle at position (169, 174).
; PLAN: r0=169(x), r1=174(y), r2=99(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 174
LDI r2, 99
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
