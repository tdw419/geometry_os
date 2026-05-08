; DESCRIPTION: Draws a horizontal red line across the middle of the screen.� r3, r14

LDI r12, 10
LDI r0, 0x2000
STORE r0, r12
CALL draw_status_bar

draw_status_bar:
PUSH r31

LDI r3, 0x2000
LOAD r3, r3
LDI r14, 0x00FF
AND r3, r14
CALL draw_status_bar
JMP draw_status_done

draw_status_bar:
LDI r3, 0x2004
LOAD r3, r3
LDI r12, 0

draw_status_loop:
JZ r3, draw_startus_bar
LDI r12, 0x3005
STORE r3, r12
JMP draw_startus_done

draw_status_b