; DESCRIPTION: Places a cyan 48x105 rectangle at position (169, 91).
; PLAN: r0=169(x), r1=91(y), r2=48(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 91
LDI r2, 48
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
