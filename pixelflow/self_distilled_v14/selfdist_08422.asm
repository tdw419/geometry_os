; DESCRIPTION: Creates a cyan filled rectangle of size 48x47 starting at (152, 69).
; PLAN: r0=152(x), r1=69(y), r2=48(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 69
LDI r2, 48
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
