; DESCRIPTION: Renders a white line between points (488, 146) and (168, 209).
; PLAN: r0=488(x1), r1=146(y1), r2=168(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 146
LDI r2, 168
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
