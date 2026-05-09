; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (138, 27) spanning 23 by 71 pixels. Then Places a white line segment connecting (158, 215) to (237, 138).
; PLAN: r0=138(x), r1=27(y), r2=23(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=158(x1), r1=215(y1), r2=237(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (138, 27) spanning 23 by 71 pixels.
; PLAN: r0=138(x), r1=27(y), r2=23(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 27
LDI r2, 23
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (158, 215) to (237, 138).
; PLAN: r0=158(x1), r1=215(y1), r2=237(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 215
LDI r2, 237
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
